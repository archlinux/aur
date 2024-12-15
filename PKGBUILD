# Maintainer: Anthony Wang <a aat unnamed dt website>
_pkgname=porkbun-dynamic-dns-python
pkgname=${_pkgname}-git
pkgver=r26.da721eb
pkgrel=1
pkgdesc="A fork of the official Porkbun dynamic DNS client written in Python"
arch=(any)
url="https://codeberg.org/exozyme/porkbun-dynamic-dns-python"
license=('MIT')
depends=('python' 'python-requests')
backup=('etc/porkbun-ddns.json')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -vDm755 porkbun-ddns.py "$pkgdir/usr/bin/porkbun-ddns"
  install -vDm600 config.json.example "$pkgdir/etc/porkbun-ddns.json"
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/porkbun-ddns.service"
  install -vDm644 systemd.timer "$pkgdir/usr/lib/systemd/system/porkbun-ddns.timer"
}
