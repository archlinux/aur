# Maintainer: Diab Neiroukh <public at thezest dot dev>
# Co-aintainer: Nicholas Galderisi <ngalderisi at spar dot com>

pkgname="ssa-bin"
pkgver="6.40_6.0"
pkgrel=3
arch=("x86_64")
pkgdesc="HPE Smart Storage Administrator Web GUI"
license=("custom")
depends=(
	"bash"
)
provides=("ssa")
source=(
	"https://downloads.linux.hpe.com/SDR/repo/mcp/oracle/9/x86_64/current/${pkgname//-bin/}-${pkgver//_/-}.x86_64.rpm"
	"hpessad.service"
)
b2sums=(
	"d6beaf691d6d66ac63c905dafa16952bd2d59b860c3b211a366bce944c0089cadee5905dfafb44ae2b0a2aaa9369020913e6359a08f513c0158d4f2d0f9d3347"
	"4001eb796b11a30432b09b42a562b6e5f88e905b8d29acaa3f3e05a924ab5eb5e72454217df39907d8ef6a93de88b10d02380afd3b9725d1f300f885318f8177"
)

package() {
	mv "usr/man" "usr/share/man"
	mv "usr/sbin" "usr/bin"
	chmod 755 "usr/bin/ssa"
	chmod 755 "opt/smartstorageadmin/ssa/bin/ssa"
	chmod 755 "opt/smartstorageadmin/ssa/bin/ssaclient"
	install -D -m644 "opt/smartstorageadmin/ssa/ssa.license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	rm "opt/smartstorageadmin/ssa/ssa.license"
	cp -r "opt/." "$pkgdir/opt"
	cp -r "usr/." "$pkgdir/usr"
	install -D -m644 hpessad.service "$pkgdir/usr/lib/systemd/system/hpessad.service"
}
