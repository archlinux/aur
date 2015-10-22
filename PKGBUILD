# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>

pkgname=pycraft-git
pkgver=20150909.89f9d57
pkgrel=1
pkgdesc='A Minecraft-inspired game for the terminal '
url='https://github.com/itsapi/pycraft'
arch=('i686' 'x86_64')
license=('GPL V2')
makedepends=('git')
source=("pycraft::git+https://github.com/itsapi/pycraft.git")
sha1sums=('SKIP')
depends=('python')

pkgver() {
	cd "${srcdir}/pycraft"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd "${srcdir}/"
	install -m777 -d "${pkgdir}/opt/pycraft"
	cp -R "${srcdir}/pycraft" "${pkgdir}/opt/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=PyCraft
GenericName=pycraft
Comment=A Minecraft-inspired game for the terminal 
Exec=pycraft
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/pycraft.desktop"
  echo "cd /opt/pycraft/
python3 /opt/pycraft/main.py" > "$pkgdir/usr/bin/pycraft"
  chmod +x "$pkgdir/usr/bin/pycraft"
}

