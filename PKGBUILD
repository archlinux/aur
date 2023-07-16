pkgname=degourou
pkgver=1.3.8
pkgrel=1
pkgdesc="Automate the process of getting decrypted ebook from InternetArchive without the need for Adobe Digital Editions and Calibre"
url="https://gitlab.com/bipinkrish/DeGourou"
arch=('any')
license=('GPL')
depends=('python-pycryptodomex' 'python-lxml' 'python-cryptography' 'python-charset-normalizer')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bipinkrish/DeGourou/-/archive/v$pkgver/DeGourou-v$pkgver.tar.gz" "starter.py")
sha256sums=('d438df491ec28ee19a1a5d5adea01ff8c25a89024ee44d131b50689025775e24'
            '515dc7cb110c904794183f4c95765d68b683c17316c1d425fb4cf1db07afa034')

package() {
    cd "$srcdir/DeGourou-v$pkgver"
    # fix import error
    sed -i "s/from charset_normalizer import md__mypyc//g" setup/ia.py
    # copy files
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -R DeGourou.py setup decrypt "$pkgdir/opt/$pkgname/"
    install -Dm755 ../starter.py "$pkgdir/usr/bin/degourou"
}
