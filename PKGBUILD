# Maintainer:  
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: xiota (https://aur.archlinux.org/account/xiota)
# Contributor: j.r <j.r@jugendhacker.de>

_pkgname="telegram-tg"
pkgname="$_pkgname-git"
pkgver=0.19.0.r3.g2b0c0cf
pkgrel=4
pkgdesc="Telegram client for terminal"
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
arch=('any')

depends=(
  'python'
  'python-mailcap'
  'python-telegram'
)
makedepends=(
  'git'
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
