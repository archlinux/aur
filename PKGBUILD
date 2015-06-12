# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=openbox-menu-git
_gitname=openbox-menu
pkgver=0.r9.5a278b2
pkgrel=1
pkgdesc="Generate an openbox menu from *.desktop files with icon support."
arch=('any')
url="https://github.com/woho/openbox-menu"
license=('GPL')
depends=('python')
source=(git+https://github.com/woho/$_gitname)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/$_gitname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/$_gitname
	
	install -Dm644 menuconfig.py "$pkgdir"/usr/share/$_gitname/menuconfig.py
	install -Dm644 obmenu.py "$pkgdir"/usr/share/$_gitname/obmenu.py
	
	mkdir -p "$pkgdir"/{usr/bin,etc}
	
cat << EOF > "$pkgdir"/usr/bin/openbox-menu
#!/bin/bash
cd "/usr/share/openbox-menu/"
python ./obmenu.py
EOF

	chmod +x "$pkgdir"/usr/bin/openbox-menu
	ln -s /usr/share/$_gitname/menuconfig.py "$pkgdir"/etc/openbox-menu.conf
}
