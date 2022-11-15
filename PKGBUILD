# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_appname=pulsar
_reponame=pulsar-edit
_tasktag=4841168219930624
_datetag=2022111519

pkgname="${_appname}-bin"
pkgver="1.63.${_datetag}"
pkgrel=1
pkgdesc="Community build of the hackable text editor, built on Electron"
arch=("x86_64")
url="https://github.com/${_reponame}/${_appname}"
license=("MIT")
depends=("libxkbfile" "ripgrep")
optdepends=(
  "ctags: symbol indexing support"
  "git: Git and GitHub integration"
  "hunspell: spell check integration"
)
provides=("${_appname}")
conflicts=("${_appname}")
source=("${_appname}-${pkgver}.deb::https://api.cirrus-ci.com/v1/artifact/task/${_tasktag}/binary/binaries/${_appname}_${pkgver}_amd64.deb")
sha256sums=('62616511221bee0a76185e843e1d842cb133d972b1e72fe3fbe0425f3302f029')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/ppm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/${_appname}.sh"

  ln -sf "/opt/Pulsar/resources/${_appname}.sh" "$pkgdir/usr/bin/${_appname}"
}
