# Maintainer: moreka <m.r.karimi.j[at]gmail[dot]com>
# Contributor: j605 <jagannathante[at]gmail[dot]com>
# Contributor: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=notmuch-addrlookup-c
pkgver=v10
pkgrel=1
pkgdesc="A tool to query the notmuch database for addresses."
url="https://github.com/aperezdc/notmuch-addrlookup-c"
arch=('x86_64')
license=('MIT')
depends=('notmuch-runtime' 'glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aperezdc/notmuch-addrlookup-c/archive/${pkgver}.tar.gz"
        "fix-reading-from-notmuch-profiles.patch"
        "MIT-LICENSE")
sha256sums=('bd747bf224c5a9411d419b7eb97a5896065396d07f5c7049a8963c9c1cb34e66'
            '0954c13c779518dfeb8feee79c4b4753673f75311c46390cbe7c11819914add2'
            '0bc357a5808a1522b3efa74682c7e789a0e7e0b11cabaf3afea130cc7c6bb2c3')

prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver#*v}"
  patch -Np1 -i ../fix-reading-from-notmuch-profiles.patch
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgver#*v}"
  make
}

package()
{
  install -Dm644 "${srcdir}/MIT-LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/MIT-LICENSE"
  cd "${srcdir}/${pkgname}-${pkgver#*v}"
  install -Dm755 notmuch-addrlookup "$pkgdir/usr/bin/notmuch-addrlookup"
}
