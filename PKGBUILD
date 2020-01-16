# Maintainer:

pkgname=yin-yang-git
pkgver=r43.dcef1e0
pkgrel=2
pkgdesc="Automatic night mode for KDE, VSCode and GTK apps"
arch=('any')
url="https://github.com/daehruoydeef/Yin-Yang"
license=('MIT')
depends=('python-pyqt5' 'python-qtpy')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/daehruoydeef/Yin-Yang")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Yin-Yang"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/Yin-Yang"
	install -d $pkgdir/{opt/${pkgname%-git},usr/bin,usr/share/applications}
	cp -r ./* $pkgdir/opt/${pkgname%-git}
	rm -f $pkgdir/opt/${pkgname%-git}/{install.sh,uninstall.sh}
	chmod +x $pkgdir/opt/${pkgname%-git}/src/${pkgname%-git}
	ln -s $pkgdir/opt/${pkgname%-git}/src/${pkgname%-git} $pkgdir/usr/bin/${pkgname%-git}
	install -Dm644 src/ui/assets/icon2.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE

	cat <<EOF >$pkgdir/usr/share/applications/${pkgname%-git}.desktop
[Desktop Entry]
Type=Application
Name=Yin & Yang
Comment=Automatic night mode for KDE, VSCode and GTK apps
Path=/opt/yin-yang
Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=1 sh /usr/bin/yin-yang -gui
Icon=yin-yang
Terminal=false
Categories=Education;Languages;Python;
EOF
}
