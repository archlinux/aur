# Maintainer: Norbert <sandwich@archworks.co>

pkgname=semaphore-bin
pkgver=2.16.45
pkgrel=1
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
sha256sums_x86_64=('b07244a89734308cf49e805a6d6ed3ee4fc0b19e2ad45fb053e0ad39c3176ede'
                   '712c2b4c8db3c909f0dce687e138e7d53737308a79183d5d9fd05f4dc5792dd9'
                   'fb2699dfd2c5873ae5ffb340bb38d88ea7ab39034f338ba2915e8e91320e9945')
sha256sums_aarch64=('7e8eda12a4e585266044600a74a96155ac317e67a4201d055e7a9a8cfe2db1cd'
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
