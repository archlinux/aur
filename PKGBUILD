# Maintainer: Paulo Fino (somepaulo)
# Native Arch binaries built on OBS from tagged upstream GitHub releases:
# https://build.opensuse.org/package/show/home:somepaulo:Audacity/audacity-bin
# This is an unofficial community build, not an upstream Audacity binary.

pkgname=audacity-bin
pkgver=4.0.2
pkgrel=1
pkgdesc='Audio editor and recorder (Arch binaries of tagged GitHub Audacity releases, built on OBS)'
arch=('x86_64')
url='https://www.audacityteam.org/'
license=('GPL-3.0-or-later')
groups=('pro-audio')

# OBS package release is independent of the AUR packaging release above.
_obs_pkgrel=1
# Use the publishing origin: redirecting mirrors can retain an older rebuild.
_obs_url='https://downloadcontent.opensuse.org/repositories/home:/somepaulo:/Audacity/Arch'
_obs_archive="${pkgname}-${pkgver}-${_obs_pkgrel}-x86_64.pkg.tar.zst"
_obs_sha256='b6164cb6dd3351d1118f0d7b9efed87554a85e15bcc366aeb19a6d4541a04301'
# Distinguish both makepkg's output and cached copies of previous OBS rebuilds.
_archive="obs-${_obs_sha256:0:12}-${_obs_archive}"

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
  'libid3tag'
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
conflicts=('audacity' 'audacity-git' 'audacity4-bin')

# Preserve the already-built executables and do not create a debug package.
options=('!strip' '!debug')
source_x86_64=("${_archive}::${_obs_url}/x86_64/${_obs_archive}")
sha256sums_x86_64=("${_obs_sha256}")
noextract=("${_archive}")

package() {
  bsdtar -xpf "$srcdir/$_archive" -C "$pkgdir" \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE'
}
