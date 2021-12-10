# Maintainer: A Farzat <a@farzat.xyz>

pkgname=tg-archive
pkgver=0.5.3
pkgrel=1
pkgdesc='is a tool for exporting Telegram group chats into static websites, preserving the chat history like mailing list archives.'
arch=(any)
url=https://github.com/knadh/tg-archive
license=('MIT')
depends=(python python-cryptg python-feedgen python-jinja python-pillow python-yaml python-telethon)
makedepends=(python-setuptools)
conflicts=(${provides%=*})  # No quotes, to avoid an empty entry.
source=(
        "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'LICENSE'
)
md5sums=(
        '25532eb845e0ae284dd28bf50be9e7a5'
        '55ddbd8fbf51b6f84a56155a16cd0a66'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir" --skip-build
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
