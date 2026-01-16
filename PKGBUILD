pkgname=sysdupd-git
pkgver=r3.38de8ab
pkgrel=1
pkgdesc="a sleek libadwaita system update manager for soren's rig"
arch=('any')
url="https://virex.lol"
license=('MIT')
depends=('python' 'python-gobject' 'libadwaita' 'libportal-gtk4' 'libayatana-appindicator')
makedepends=('git' 'python-setuptools')
provides=('sysdupd')
conflicts=('sysdupd')
source=('sysdupd::git+https://github.com/hnpf/sysdupd.git') # change this to your actual repo link!
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1

  # install the icons and desktop files from your data folder
  install -Dm644 data/software-update-available-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.virex.sysdupd-symbolic.svg"
  install -Dm644 data/com.virex.Sysdupd.desktop "$pkgdir/usr/share/applications/com.virex.sysdupd.desktop"
  install -Dm644 data/com.virex.Sysdupd.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/com.virex.sysdupd.gschema.xml"
}
