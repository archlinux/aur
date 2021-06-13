pkgname=sysrq-enabler
pkgver=1
pkgrel=1
pkgdesc="Enable all magicsysrq options by default"
arch=(any)
url=file:///etc/sysctl.d/99-sysrq.conf
License=('GPL')

cat <<'EOF' > install
post_install() {
	sysctl -w kernel.sysrq=1
	}

post_upgrade() {
	sysctl -w kernel.sysrq=1
	}

post_remove() {
	sysctl -w kernel.sysrq=0
	}
EOF

package() {
mkdir -pm 755 ${pkgdir}/etc/sysctl.d
echo 'kernel.sysrq=1' > ${pkgdir}/etc/sysctl.d/99-sysrq.conf
chmod 644 ${pkgdir}/etc/sysctl.d/99-sysrq.conf
}
