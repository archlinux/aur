# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Bersam Karbasion <bersam.k at gmail dot com>
# Contributor: pancho <pancho at pancho dot name>
# Contributor: taifunbrowser <bjmnbraun at gmail dot com>
# Contributor: junglepeanut <jungle1peanut1 at hotmail dot com>

pkgname=tpp
pkgver=1.3.1
pkgrel=3
pkgdesc="A text presentation program in ncurses, LaTeX, or text."
arch=('any')
url="http://www.ngolde.de/tpp.html"
license=('GPL')
depends=('ncurses' 'ruby-ncurses' 'ruby>=1.8')
makedepends=('recode')
source=(http://www.ngolde.de/download/$pkgname-$pkgver.tar.gz
        fix-for-ruby1.9.patch)
sha256sums=('68e3de94fbfb62bd91a6d635581bcf8671a306fffe615d00294d388ad91e1b5f'
            'ba280e02c1e4373f7b8f4fcbb1822f342f00188bb17d0a6d22c78f0d927dcad3')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -p0 < "${srcdir}"/fix-for-ruby1.9.patch
  recode latin1..UTF-8 "${srcdir}"/$pkgname-$pkgver/examples/*.tpp
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  make prefix="${pkgdir}"/usr install
}
