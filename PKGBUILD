# Maintainer: Jan Hambrecht <jaham at gmx dot net>

pkgname=mvpboot
pkgver=0.01
pkgrel=6
pkgdesc="Respond to boot request packets from Hauppauge MediaMVP"
arch=('any')
url="http://mvpmc.wikispaces.com/mvpboot"
license=('GPL2')
depends=('perl' 'perl-net-interface' 'perl-io-socket') 
optdepends=(
  'atftpd: tftp booting support'
)
provides=('mvpboot')
options=()
install=
source=(http://mvpmc.wikispaces.com/file/view/mvpboot/30989151/mvpboot fix-perl-net-interface-use.patch mvpboot.service mvptftp mvptftp.service)
noextract=("mvpboot")

md5sums=('2661beb243f81645344fe89acb97517d'
         '5ab5f9917a65c74a288a5d4bffd68fe4'
         'cdc0e37925b598221795972f392e1186'
         '8eff12f2c09d918a6aad7c45650ceeb5'
         '48c70b270bf8b1e8e5d942219b65be23')

prepare() {
    pwd
    patch --follow-symlinks -p0 < fix-perl-net-interface-use.patch
}

package() {
    install -Dm755 ${srcdir}/mvpboot ${pkgdir}/usr/bin/mvpboot
    install -Dm644 ${srcdir}/mvpboot.service ${pkgdir}/usr/lib/systemd/system/mvpboot.service
    install -Dm755 ${srcdir}/mvptftp ${pkgdir}/usr/bin/mvptftp
    install -Dm644 ${srcdir}/mvptftp.service ${pkgdir}/usr/lib/systemd/system/mvptftp.service
}
