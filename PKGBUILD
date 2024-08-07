# Maintainer:
# Contributor: j.r <j.r@jugendhacker.de>

## options
: ${_commit=2b0c0cf199b11e0bb5d283bd1df997f1241656e5} # 0.19.0.r3

## basic info
_pkgname="telegram-tg"
pkgname="$_pkgname"
pkgver=0.19.0
pkgrel=5
pkgdesc="Telegram client for terminal"
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
arch=('any')

depends=(
  'python'
  'python-telegram'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'libnotify: for notifications, you could also use other programs: see config'
  'ffmpeg: to record voice msgs and upload videos correctly'
  'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
  'ranger: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
  'nnn: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
  'fzf: to create groups and secret chats, used for single and multiple user selection'
)

_pkgsrc="tg-$_commit"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver-${_commit::7}.$_pkgext"::"$url/archive/$_commit.$_pkgext")
sha256sums=('SKIP')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
