# Maintainer: Norbert <sandwich@archworks.co>

pkgname=semaphore-bin
pkgver=2.9.37
pkgrel=2
pkgdesc="Modern UI for Ansible (Binary Release)"
arch=('x86_64' 'aarch64')
url="https://www.ansible-semaphore.com/"
license=('MIT')
depends=('ansible-core')
optdepends=(
  'ansible: Full Ansible assortment'
  'postgresql: PostgreSQL database support'
  'mariadb: MariaDB database support'
  'postfix: Mail server support'
)
install=semaphore.install
source_x86_64=(
  "semaphore_${pkgver}_linux_amd64.tar.gz::https://github.com/ansible-semaphore/semaphore/releases/download/v${pkgver}/semaphore_${pkgver}_linux_amd64.tar.gz"
  "semaphore.service"
  "semaphore.sysusers.d"
)
source_aarch64=(
  "https://github.com/ansible-semaphore/semaphore/releases/download/v${pkgver}/semaphore_${pkgver}_linux_arm64.tar.gz"
  "semaphore.service"
  "semaphore.sysusers.d"
)
sha256sums_x86_64=('ba2e687b1cb5f51c42ba11bd97dfcb3e70a49c85893e54cafca942612aa0713b'
                   '712c2b4c8db3c909f0dce687e138e7d53737308a79183d5d9fd05f4dc5792dd9'
                   'fb2699dfd2c5873ae5ffb340bb38d88ea7ab39034f338ba2915e8e91320e9945')
sha256sums_aarch64=('d4258e34a6113fceaf828e9285dd7246c949b6e7d2a38e58968230a98390e9c1'
                    '712c2b4c8db3c909f0dce687e138e7d53737308a79183d5d9fd05f4dc5792dd9'
                    'fb2699dfd2c5873ae5ffb340bb38d88ea7ab39034f338ba2915e8e91320e9945')

package() {
  # Move the semaphore binary '/usr/lib'
  mkdir -p "$pkgdir/usr/bin/"
  cp -r "semaphore" "$pkgdir/usr/bin/"

  # Install User and Service
  install -Dm644 "semaphore.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "semaphore.sysusers.d" "${pkgdir}/usr/lib/sysusers.d/semaphore.conf"

	# Install the LICENSE file to /usr/share/licenses/$pkgname/
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
