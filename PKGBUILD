# Maintainer : Sebastian Lau <lauseb644 _at_ gmail .dot. com>
# Contributor: yochananmarqos <yochanan.marqos@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=2.2.0
pkgrel=1
pkgdesc="CollabNet GitEye is a desktop for Git. It works with TeamForge, CloudForge and other Git services."
arch=('x86_64')
url="https://www.collab.net/products/giteye"
license=('custom')
depends=('git' 'java-runtime>=8' 'python')
options=('!strip')
source=("https://www.collab.net/sites/default/files/downloads/GitEye-$pkgver-linux.x86_64.zip"
	"LICENSE"
        "${pkgname}.desktop")
md5sums=('117d6e1e905aea0ec91ce18e155e87a1'
         '78ba2a04c6b766a778681705d40abbb4'
         '0299696f06b199eb9b5735057f503fe9')
noextract=(*.zip) # extract nothing


package() {
    cd "$srcdir"

    msg2 "Extracting GitEye from archive..."
    install -Ddm755 "$pkgdir/opt/$pkgname/"
	install -Ddm755 "$pkgdir/usr/bin/"

    bsdtar -xf "GitEye-$pkgver-linux.$CARCH.zip" -C "$pkgdir/opt/$pkgname/"

	msg2 "Adding GitEye executable to default path..."
	ln -s "/opt/${pkgname}/GitEye" "${pkgdir}/usr/bin/giteye"

    msg2 "Installing LICENSE..."
	if [[ "$CARCH" = "i686" ]]; then
		sed -i 's/64-bit/32-bit/' LICENSE
	fi
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    msg2 "Installing desktop file and icon..."
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/opt/${pkgname}/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
