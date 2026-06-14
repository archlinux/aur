# Maintainer: kstover <dev at kstover dot net>
#
pkgname=python-httpdocs
pkgver=1.0.0
pkgrel=1
pkgdesc="HTTP server providing HTML documentation for Python"
arch=(any)
url="https://python.org"
license=("AGPLv3")
options=("!debug")
depends=("python" "python-docs")
package() {
    mkdir -pm0755 "${pkgdir}/usr/lib/systemd/system"
    cat << EOF > "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
[Unit]
Description=HTTP server providing HTML documentation for Python
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/python -m http.server %i -d /usr/share/doc/python/html
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}

