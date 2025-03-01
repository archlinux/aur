# Maintainer: Your Name <superchief@evertvorster.com>
pkgname=dynamic-power-daemon
pkgver=1.0.0
pkgrel=3
pkgdesc="A dynamic power daemon for managing system performance based on load"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL-3.0-or-later')
depends=('bc')
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # You can generate this by running `sha256sum v1.0.0.tar.gz`


package() {
  # Install the main script
  install -Dm755 "$srcdir/dynamic-power-daemon-$pkgver/dynamic_power.sh" "$pkgdir/usr/bin/dynamic_power.sh"

  # Install configuration file
  install -Dm644 "$srcdir/dynamic-power-daemon-$pkgver/dynamic-power.conf" "$pkgdir/etc/dynamic-power.conf"

  # Install systemd service file
  install -Dm644 "$srcdir/dynamic-power-daemon-$pkgver/dynamic-power.service" "$pkgdir/usr/lib/systemd/system/dynamic-power.service"

  # Optionally create symlinks for systemd service
  # ln -sf /etc/systemd/system/dynamic-power.service "$pkgdir/etc/systemd/system/multi-user.target.wants/dynamic-power.service"
  }

# Optional: post-installation instructions to reload systemd daemon
post_install() {
  echo "Reloading systemd daemon..."
  systemctl --system daemon-reload
  systemctl enable dynamic-power-daemon.service
}

