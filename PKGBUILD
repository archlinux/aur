# Maintainer: Aleksey V. Mikhaylov <gmikhalytch@gmail.com>
_pkgname="cue2tracks"
_untagged_upstream_version="0.2.17"
_pkgver_base="${_untagged_upstream_version}"
_pkgver="${_pkgver_base}.r30.afe350c"
pkgname="${_pkgname}-git"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Bash script for splitting audio CD image to tracks with cue sheet info"
url="https://github.com/ar-lex/cue2tracks"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
arch=('any')
depends=(
    'bash'
    'cuetools'
    'shntool'
    'file'
    'glibc'
    'flac'
)
makedepends=(
    'git'
)
optdepends=(
    'vorbis-tools: For OGG support'
    'flake: Alternative FLAC encoder'
    'mac: For APE support'
    'wavpack: For WavPack support'
    'optimfrog: For OptimFROG support'
    'shorten: For shorten support'
    'lame: For MP3 support'
    'musepack-tools: For MusePack support'
    'ttaenc: For True Audio Codec support'
    'faac: For AAC in M4A support'
    'faad2: For AAC in M4A support'
    'tak: For TAK support'
    'id3v2: For MP3 tagging support'
)
source=("${_pkgname}::git+https://github.com/ar-lex/cue2tracks.git")
md5sums=('SKIP')

# based on best practices being documented here: https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
    # change dir to cloned upstream sources
  cd "${srcdir}/${_pkgname}"

    # following lines first trying to get the git description on upstream
    #   (and once upstream have started having tags it will succeed),
    # then fallbacks to printing something artificial, using
    #   hardcoded known upstream, VSC revisions amount, and HEAD hash

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" \
           "$(echo "${_untagged_upstream_version}")" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
  )

}

package() {
 cd "$srcdir"/"${_pkgname}"
 make install PREFIX="${pkgdir}/usr"
}
