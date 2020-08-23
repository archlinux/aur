# Maintainer Lingfeng Ren <lastname+firstname+8thfibonaccinumber@gmail.com>

pkgname=fetchcord-git
pkgver=r464.245a30b
pkgrel=1
pkgdesc="FetchCord grabs your OS info and displays it as Discord Rich Presence"
arch=('any')
url="https://github.com/MrPotatoBobx/fetchcord"
license=('MIT')
depends=('python')
provides=('fetchcord')
depends=('python-pypresence' 'neofetch' 'python-psutil')
source=("fetchcord::git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fetchcord"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fetchcord"
  python setup.py build
}

package() {
  cd "$srcdir/fetchcord"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 systemd/fetchcord.service "$pkgdir"/usr/lib/systemd/user/fetchcord.service
}
