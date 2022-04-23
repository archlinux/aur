# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor:: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=catdvi
pkgver=0.14
pkgrel=8
pkgdesc='A DVI to plain text translator'
arch=('x86_64')
url='http://catdvi.sourceforge.net'
license=('GPL')
depends=('glibc' 'texlive-core')
makedepends=('texlive-fontsextra')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'texlive2008.patch'
        'fix_build.patch')
sha256sums=('a2b55055d42e457a7ffce1a403bc5189d362e3e27eb64c37f7c2cf67e1d7fa4f'
            'c067932ede44b92fd6d7cc10f1e7880860dac690f7ab0ab066270892479d0a4f'
            '8e0c251f8a87c553388b54df7d4c4e5283a1f7e641399e7c52eb1fe33ac5d404')

prepare() {
  cd "$pkgname-$pkgver"
  patch <"$srcdir/texlive2008.patch"
  # fix build errors in newer gcc version https://aur.archlinux.org/packages/catdvi#comment-862200
  patch <"$srcdir/fix_build.patch"
}

build() {
  cd "$pkgname-$pkgver"
  autoconf
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
  make DESTDIR="$pkgdir" install bindir="$pkgdir"/usr/bin mandir="$pkgdir"/usr/share/man
}
