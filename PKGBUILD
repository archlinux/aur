# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=alienvault-agent
pkgver=20.07.0003.0301
pkgrel=1
pkgdesc="AlienVault Agent"
arch=('x86_64')
url="https://cybersecurity.att.com/documentation/usm-anywhere/agents/alienvault-agents.htm"
license=('custom')
depends=('bash' 'rsyslog' 'zlib')
makedepends=()
backup=("etc/osquery/osquery.flags.default"
        "etc/osquery/osquery.flags.example"
        "etc/osquery/secret"
        "etc/rsyslog.d/90-osquery.conf"
        "etc/sysconfig/osqueryd")
source=("https://prod-usm-saas-agent-config.s3.amazonaws.com/repo/deb/pool/stable/a/al/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('dd49ec87cedd0a10644de46a3aecb5169c840a93e4a5993616eb5281d381b9d1')

prepare() {
    mkdir data && tar -xvf data.tar.gz -C data
}

package() {
    cd data
    install -dm755 "$pkgdir/etc" && cp -av etc/{osquery,rsyslog.d,sysconfig} "$pkgdir/etc"
    install -dm755 "$pkgdir"/var/log/osquery
    cp -av usr "$pkgdir"
}
