# Maintainer Mircea Mihalea <mircea at mihalea dot ro>

pkgname=i3expo
pkgver=1.1.2
pkgrel=1
pkgdesc="Provide a workspace overview for i3wm"
url="https://github.com/mihalea/i3expo"
depends=('python' 'python-i3ipc' 'python-pillow-simd' 'python-pygame' 'python-xdg')
makedepends=('gcc' 'python-setuptools')
license=('MIT')
arch=('any')
provides=('i3expo-daemon' 'i3expo')
source=("git+https://github.com/mihalea/${pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    cd "i3expo"
		gcc -shared -O3 -Wall -fPIC -Wl,-soname,prtscn -o prtscn.so package/prtscn.c -lX11
    python setup.py build
}

package() {
    depends+=()
    cd "i3expo"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
		install -D -m 0644 "prtscn.so" "${pkgdir}/usr/share/${pkgname}/prtscn.so"
		install -D -m 0644 "package/prtscn.c" "${pkgdir}/usr/share/${pkgname}/prtscn.c"
		install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
