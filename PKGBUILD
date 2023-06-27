# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Barry Smith <brrtsm at gmmal dot com>

pkgname="ntopng-bin"
# to update visit https://packages.ntop.org/apt/bullseye/x64/ and keep track of the latest pkgver, date and build
_pkgverAmd=5.7
_dateAmd=230627
_buildAmd=20855
# to update visit https://packages.ntop.org/apt/bullseye_pi/arm64/ and keep track of the latest pkgver, date and build
_pkgverArm=5.7
_dateArm=230625
_buildArm=20826
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="https://www.ntop.org/"
license=("GPL3")
arch=("x86_64" "armv7h" "aarch64")
provides=("ntopng")
conflicts=("ntopng" "ntopng-git")
depends=("hiredis"
         "libcap"
         "libmariadbclient"
         "libmaxminddb"
         "rrdtool"
         "sqlite"
         "zeromq")
#optdepends=("ntopng-data")
source=("ntopng.sysusers"
	    "ntopng.tmpfiles"
	    "ntopng@.service")
source_x86_64=("https://packages.ntop.org/apt/bullseye/x64/ntopng_${_pkgverAmd}.${_dateAmd}-${_buildAmd}_amd64.deb")
source_armv7h=("https://packages.ntop.org/apt/buster_pi/armhf/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_armhf.deb")
source_aarch64=("https://packages.ntop.org/apt/bullseye_pi/arm64/ntopng_${_pkgverArm}.${_dateArm}-${_buildArm}_arm64.deb")
sha256sums=('58518c808ea300350e6aaa83fafb2320dfed85dd8615793bba3d5b6041edb1b5'
            '454688247e747d96b258f2e2317cdc29bfbf42b35bf03f10363182e8844cd50f'
            '034d4fa2a6616a6240edc74e278b96e45730e7acc12d60a7b4458b04906c127b')
sha256sums_x86_64=('31bc2b1d707a3709feedc53dafe0ed2a88303235a13b2e0d9c85bfaba9b13b3a')
sha256sums_armv7h=('8b290a32a6144aa19285bc9ebef9d877fb40e617e6062449ad39a88db6bca6a8')
sha256sums_aarch64=('4a7491c9049b7e3df8ce93fec615fc6c2e5194d161b4fa16939ebba8a4f22f42')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
 # systemd files
 install -D -m 644 "ntopng.sysusers" "$pkgdir/usr/lib/sysusers.d/ntopng.conf"
 install -D -m 644 "ntopng.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ntopng.conf"
 install -D -m 644 "ntopng@.service" "$pkgdir/usr/lib/systemd/system/ntopng@.service"
}
