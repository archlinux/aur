# Maintainer: João Miguel <jmcf125 at openmailbox dot org>
pkgname=auditd-openrc
pkgver=20151011
pkgrel=1
pkgdesc="OpenRC auditd init script"
url='http://people.redhat.com/sgrubb/audit/'
arch=('any')
license=('GPL')
depends=('audit' 'openrc-core')
install='audit.install'
_base_url="https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-process/audit/files"
source=("$_base_url/auditd-conf.d-2.1.3"
         "$_base_url/auditd-init.d-2.4.3")
# better to have different versions ^^^-- rather than an outdated init file
sha256sums=('792f6bf0630afc649780428440a18f5ba849206eb04feff2a834520a0cfca0a8'
            'f30f3bdf906d98fa0c40055a0b0f474b2ac6ebe69da5aa738caf464fadd0cb47')

pkgver() {
   date +%Y%m%d
}

_inst_confd(){
   install -Dm755 "${srcdir}/${1}-conf.d-2.1.3" "${pkgdir}/etc/conf.d/$1"
}
_inst_initd(){
   install -Dm755 "${srcdir}/${1}-init.d-2.4.3" "${pkgdir}/etc/init.d/$1"
}

package() {
   _inst_confd 'auditd'
   _inst_initd 'auditd'
}
