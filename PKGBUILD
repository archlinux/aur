# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=2
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=('GPL')
url="https://rseichter.github.io/fangfrisch/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
replaces=('clamav-unofficial-sigs')
depends=('clamav' 'python' 'python-sqlalchemy')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "${_name}.conf"
        "${_name}.service"
        "${_name}.timer"
        "${_name}.tmpfiles")
sha512sums=('0e5ef64ea2a5a01874d54be09378c377b33c340760b4800a390cbc08ef071a60c8c619c01c1f00248d2435a986a6d33b14da9998368a38416f875d7cdd1b1620'
            '695f6e9520e6742bd0b5f4124af8c1ee58adc8317c1fdd28eadd31c23cf984e36c49e71acba3c82441f550661e6b12c5a7d47932d1f02d001f7420f52dabbb87'
            '810fd48296fdac2b141ac8a9da02a9c133f3ae0b62177c62e72b03aab0c86b2c062f53ab070d4c5e8cbb7a6bfa6f9879225c46f604d9a0914deb0f0798a86f03'
            '5f17b94c2a86ed468ac12f84bd258b915cfaa1858cada3e59293489447c634c6401921d654000d87f8eca970bfba8a9506aced100902771d98efc7d4cdb27cb5'
            'f421c4f2618422957cd203bf8f50bae1e5656d6208774244092987c07427ca86bf587884510c9180a0cb554200fdc996b0fad382671c913e6729b215b6f8e651')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
    cd $_name-$pkgver
    python setup.py build
}

#check() {
#    cd $_name-$pkgver
#    python setup.py pytest
#}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/${_name}.conf"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_name}".{service,timer}
    install -Dm644 "${srcdir}/${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
}
