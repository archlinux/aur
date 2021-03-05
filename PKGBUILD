# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-telethon-session-sqlalchemy
_pkgname=telethon-session-sqlalchemy
pkgver=0.2.16
pkgrel=1
pkgdesc="SQLAlchemy backend for Telethon session storage"
url="https://github.com/tulir/telethon-session-sqlalchemy"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/d1/bb/1522ed4df397e95c50b3e745512516450ef04ad5d168c724cb3e6254a663/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f847c57302a102eb88e29ed95b8f4efa69582db2966fd806c21376b9a66ad4a8')

prepare() {
    cd telethon-session-sqlalchemy-${pkgver}
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd telethon-session-sqlalchemy-${pkgver}
    python setup.py build
}

package() {
    cd telethon-session-sqlalchemy-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
