# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_appname=pulsar
_reponame=pulsar-edit
_tasktag=6076301491568640
_datetag=2022120804

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
sha256sums=('d31cfe8a5fa6cbb37075f4102197d04077e751406387f6b11756c03d07f841e1')

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
