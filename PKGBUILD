pkgname=fake-hwclock
pkgver=0.14
pkgrel=2
pkgdesc="Saves time on shutdown and restores it on boot from a file"
arch=('any')
license=('GPL')
install=fake-hwclock.install
source=('git+https://git.einval.com/git/fake-hwclock.git')
sha512sums=('SKIP')

package() {
  install -D -m0755 "${srcdir}/fake-hwclock/fake-hwclock" "${pkgdir}/usr/bin/fake-hwclock"
  install -D -m0644 "${srcdir}/fake-hwclock/etc/default/fake-hwclock" "${pkgdir}/etc/default/fake-hwclock"

  for unit in \
    fake-hwclock-load.service \
    fake-hwclock-save.service \
    fake-hwclock-save.timer
  do
    install -D -m644 "${srcdir}/fake-hwclock/debian/${unit}" "${pkgdir}/usr/lib/systemd/system/${unit}"
  done
}
