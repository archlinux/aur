# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname='etc-update'
pkgdesc="CLI to interactively merge .pacnew in /etc"
pkgver=2.3.24
pkgrel=1
arch=('any')
url="https://wiki.gentoo.org/wiki/Handbook:X86/Portage/Tools#etc-update"
license=('GPL')
depends=('bash')
makedepends=('git')
source=("https://github.com/gentoo/portage/archive/portage-$pkgver.tar.gz")
md5sums=('27e4be95612157b29725a49fffd33b9e')

prepare() {
  sed -e "/Public License v2/a # Ported to Arch Linux by:\n# Kewl <xrjy@nygb.rh.bet(rot13)>
    /^OS_RELEASE_ID=/c\OS_RELEASE_ID=arch
    s/suse|opensuse/arch/
    s/'suse'/'arch'/g
    s/\.rpmnew/\.pacnew/g
    s/Gentoo's/Arch/g
    s/PROTECT='\/etc'/PROTECT='\/etc \/usr\/lib \/usr\/share\/config'/
    s/PROTECT_MASK=''/PROTECT_MASK='\/etc\/udev\/rules.d'/
    s/local file ofile /local file ofile='.pacnew' /
    s/file:10/file::-7/g" "portage-portage-$pkgver/bin/$pkgname" > "$pkgname"
}

package() {
  install -Dm 0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 0644 "portage-portage-$pkgver/cnf/$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
