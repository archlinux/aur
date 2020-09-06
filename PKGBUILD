# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=td-agent
pkgver=4.0.1
pkgrel=1
_pkgrel=1
pkgdesc='Open-Source Log Collector'
arch=('x86_64')
url='https://www.fluentd.org/'
license=('MIT')
options=('!strip')
source=(https://packages.treasuredata.com/4/ubuntu/bionic/pool/contrib/t/td-agent/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb)
install=td-agent.install
backup=('etc/td-agent/td-agent.conf')

package() {
  cd "$srcdir"

  tar xf data.tar.xz -C "$pkgdir/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"

  mv "$pkgdir/lib/systemd" "$pkgdir/usr/lib/systemd"
  rmdir "$pkgdir/lib"

  sed -i -e 's#/var/run/td-agent#/run/td-agent#g' "$pkgdir/usr/lib/tmpfiles.d/td-agent.conf" "$pkgdir/usr/lib/systemd/system/td-agent.service"

  rm -r "$pkgdir/usr/share/lintian"
}

# vim: set ft=sh:

sha512sums=('651d48177f73855e5b77f117c39dc75b0019650895747a6dbbe002a797571b991a79dc091efd88519c0d72eacd26b9ac9d932652bdbf2ac8ad754257527a04f5')
