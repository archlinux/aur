# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gosync-git
pkgver=0.4
pkgrel=1
pkgdesc='An Opensource Google Drive client written in Python'
arch=('any')
url="https://hschauhan.github.io/gosync"
license=('GPL2')
provides=('gosync')
depends=('python-google-api-python-client'
         'python-google-auth-httplib2'
         'python-google-auth-oauthlib'
         'python-watchdog'
         'python-wxpython')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname%-git}::git+https://github.com/hschauhan/gosync")
sha256sums=('SKIP')

package() {
  cd gosync
  python setup.py install --root="$pkgdir/" --optimize=1
  gendesk -f -n --pkgname "${pkgname%-git}" \
          --pkgdesc "$pkgdesc" \
          --name "GoSync" \
          --comment "$pkgdesc" \
          --exec GoSync \
          --categories 'Network;Application;' \
          --icon "${pkgname%-git}"
  install -Dm644 GoSync/resources/GoSyncIcon-64.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}