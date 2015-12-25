# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=enjarify
pkgver=1.0.0
pkgrel=1
pkgdesc="Translating Dalvik bytecode to Java bytecode"
arch=(any)
url="https://github.com/google/enjarify"
license=('Apache')
depends=("python")
source=("https://github.com/google/enjarify/archive/${pkgver}.tar.gz"
        'pythonpath.patch')
sha256sums=('b4ef8c8d5773a8e1878eadd0a4d7189ff06a83bbbdd7f405edf139672a769f63'
            'be411711026be0b8fc6dfb77fb46c350ff8920f882651d6667b253ab8eedef1e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/pythonpath.patch"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p "${pkgdir}/usr/lib/"
        cp -R enjarify "${pkgdir}/usr/lib/"
        install -m755 -D enjarify.sh "${pkgdir}/usr/bin/enjarify"
}
