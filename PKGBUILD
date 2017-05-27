# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=pencil
pkgver=3.0.2
pkgrel=3
pkgdesc="Sketching and GUI prototyping/wireframing tool"
arch=('any')
license=('GPL2')
url="http://github.com/evolus/pencil"
source=("https://github.com/evolus/pencil/archive/v$pkgver.tar.gz"
        "pencil.desktop"
        "pencil-mime.xml")
sha256sums=('afcbd3809e0ff4ca03579d8cc5123e4bedccf759a76e6f8d2187c62e1e97a6dc'
            '6d467da74509e74e06325e7464a6a177164ae8977470423da6cae43265dedd4d'
            '87aac9f5005ccd57aa6b1bf190052fcc4915eff1d7bddb2723863739545e42fc')
conflicts=('evolus-pencil-bin' 'pencil-v2')
depends=('nodejs' 'npm')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    npm install
    node_modules/.bin/build --linux dir

    install -d "$pkgdir/usr/share/$pkgname/" "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/applications" "$pkgdir/usr/share/mime/packages"

    cp -r dist/linux-unpacked/* "$pkgdir/usr/share/$pkgname/"
    cp app/css/images/logo-shadow.png "$pkgdir/usr/share/$pkgname/icon.png"

    cp "$srcdir/pencil.desktop" "$pkgdir/usr/share/applications/"
    cp "$srcdir/pencil-mime.xml" "$pkgdir/usr/share/mime/packages/"

    ln -s "/usr/share/$pkgname/pencil" "$pkgdir/usr/bin/"
}
