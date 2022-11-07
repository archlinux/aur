# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_appname=pulsar
_reponame=pulsar-edit
_tasktag=5872488717484032
_datetag=2022110709

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
sha256sums=('bf1692bd10e47a78ac810d4dce09d2894bcf6ec9b0b79647e308c1d7b70fd951')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/Pulsar/${_appname}" "$pkgdir/usr/bin/${_appname}"
}
