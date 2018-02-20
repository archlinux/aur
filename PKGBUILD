# Maintainer: Paul Wilk <paul.wilk@null.net>
# Contributor: Walter Dworak <preparationh67@gmail.com>

pkgname='webvirtmgr'
pkgdesc='Web front-end for KVM virtual machines'
pkgver=v4.8.9
pkgrel=2
arch=('i686' 'x86_64')
url='https://www.webvirtmgr.net/'
license=('Apache')
depends=('libvirt' 'libvirt-python' 'qemu' 'dnsmasq' 'bridge-utils' 'ebtables' 'dmidecode' 'python2' 'supervisor'
         'websockify' 'python2-django' 'python2-lockfile' 'python2-gunicorn' 'python2-django-auth-ldap')
makedepends=('python2-pip')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=('https://github.com/retspen/webvirtmgr/releases/download/v4.8.9/webvirtmgr.tar.gz'
        'webvirtmgr.ini'
        'webvirtmgr-novnc.service')
sha512sums=('68bd127874e07c37bef0c6e3fd49dece306f2e2f0c5c111c7339638284937e8627576d2b64ac4bda2d09f9de4cc882a5af33ba3d6630f07c0e01509367030761'
            'a8a64325750a1a6815c1ff9222373682f2300d0d636bb88675ae113b027a0e6d058e949344ae22357ff1258025ec0d32ca32a4383a37cadb88c9e5d180d2d147'
            '78ae3aef65e4c362a7d70ff3a44d1c3ccd489ed7b77311d0ecb4d795aa587dc75e43356f56e4afbb180e0558859b64cbe78ca45bb234920ff3302b01e59716db')

package() {
  outputdir="${pkgdir}/usr/lib/webvirtmgr"
  install -Dm0644 'webvirtmgr.ini' "${pkgdir}/etc/supervisor.d/webvirtmgr.ini"
  install -Dm0644 'webvirtmgr-novnc.service' "${pkgdir}/usr/lib/systemd/system/webvirtmgr-novnc.service"
  install -dm0755 "${outputdir}" "${pkgdir}/var/lib/webvirtmgr"
  cp -r "${srcdir}/webvirtmgr" "${pkgdir}/usr/lib"

  cd "${outputdir}"
  pip2 install -r 'requirements.txt' -t "${outputdir}/lib"
}
