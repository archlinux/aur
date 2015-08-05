pkgname=roundcubemail-plugin-converse
_pkgname=roundcube-converse.js-xmpp-plugin
pkgver=0.8.3.0
pkgrel=1
pkgdesc=('XMPP plugin for Roundcube Webmail based on converse.js')
arch=('any')
url="https://github.com/priyadi/${_pkgname}"
license=('MIT')
depends=('roundcubemail')
optdepends=()
source=("git://github.com/priyadi/roundcube-converse.js-xmpp-plugin.git#tag=v${pkgver}")
sha256sums=('SKIP')
makedepends=('git')
backup=("etc/webapps/roundcubemail/plugins/converse/config.inc.php")

package() {
    finaldest="${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    finalconf="${pkgdir}/etc/webapps/roundcubemail/plugins/converse"
    mkdir -p "$finaldest"
    mkdir -p "$finalconf"
    cp -a "${srcdir}/${_pkgname}" "$finaldest"
    mv "${finaldest}/${_pkgname}" "${finaldest}/converse"
    rm -rf "${finaldest}/converse/.git"*
    cp "${srcdir}/${_pkgname}/config.inc.php.dist" "${finalconf}/config.inc.php"
    ln -s "/etc/${finalconf##*/etc/}/config.inc.php" "${finaldest}/converse"
    echo "To activate add 'converse' to \$rcmail_config['plugins'] in roundcube's config file and configure plugin in its config file"
}

