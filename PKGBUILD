# Maintainer: Mike Hicklen (hicklemon) <mike@xfs.repair>
# Maintainer: Laszlo Malina <laszlo@malina.hu>

pkgname=keeper-password-manager
pkgver=17.1.1
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('libsecret' 'nss' 'libxss' 'gtk3')
source=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb"
        'LICENSE')
sha512sums=('89674ca659d42bc7ce1e66e49cb27e4511314a895329006cc21fae0208090435017d1595ae35547b4efd6ed86d3f516d51d66c5758bfa4cf3578083fdd5e648e'
            'SKIP')

package() { 
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"   

  echo "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 "$pkgdir"/usr/lib/keeperpasswordmanager/chrome-sandbox
  echo "If you are updating from 16.0.0 to a newer version, you will need to set '755' mode on directories: resources/*, locales, swiftshader - commands are below, USE AT YOUR OWN RISK:"
  echo 'find /usr/lib/keeperpasswordmanager/resources -type d -print0 | xargs -0 chmod 755'
  echo 'chmod 755 /usr/lib/keeperpasswordmanager/locales'
  echo 'chmod 755 /usr/lib/keeperpasswordmanager/swiftshader'

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$pkgdir"/usr/lib/keeperpasswordmanager/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/chromium/LICENSES.chromium.html
}
