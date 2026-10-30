# Maintainer: Paulo Fino (somepaulo)
# Native Arch binaries built on OBS from tagged upstream GitHub releases:
# https://build.opensuse.org/package/show/home:somepaulo:Audacity/audacity-bin
# This is an unofficial community build, not an upstream Audacity binary.

pkgname=audacity-bin
pkgver=4.0.1
pkgrel=3
pkgdesc='Audio editor and recorder (Arch binaries of tagged Audacity GitHub releases, built on OBS)'
arch=('x86_64')
url='https://www.audacityteam.org/'
license=('GPL-3.0-or-later')
groups=('pro-audio')

# OBS package release is independent of the AUR packaging release above.
_obs_pkgrel=2
_obs_url='https://download.opensuse.org/repositories/home:/somepaulo:/Audacity/Arch'
_obs_archive="${pkgname}-${pkgver}-${_obs_pkgrel}-x86_64.pkg.tar.zst"
# Never let the downloaded source look like makepkg's completed output package.
_archive="obs-${_obs_archive}"

depends=(
  'alsa-lib'
  'expat'
  'flac'
  'freetype2'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'lame'
  'libgcc'
  'libogg'
  'libpng'
  'libsbsms'
  'libsndfile'
  'libsoxr'
  'libstdc++'
  'libvorbis'
  'libx11'
  'lilv'
  'mpg123'
  'opus'
  'opusfile'
  'portaudio'
  'pugixml'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'soundtouch'
  'sqlite'
  'suil'
  'systemd-libs'
  'twolame'
  'wavpack'
  'wxwidgets-common'
  'zix'
  'zlib'
)
provides=("audacity=${pkgver}" 'lv2-host' 'vst3-host')
conflicts=('audacity')

# Preserve the already-built executables and do not create a debug package.
options=('!strip' '!debug')
source_x86_64=("${_archive}::${_obs_url}/x86_64/${_obs_archive}")
sha256sums_x86_64=('ad4c047b00a4568ca08835538c7f977a5a3b48e4196cfffba4edb71aeb508262')
noextract=("${_archive}")

package() {
  # Retain the complete payload and permissions, but let makepkg generate
  # fresh package metadata for this AUR recipe.
  bsdtar -xpf "$srcdir/$_archive" -C "$pkgdir" \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE'
}
