# Maintainer: Nicholas Galderisi <ngalderisi@spar.com>

pkgname=ssa
pkgver=3.40_3.0
pkgrel=1
pkgdesc="HPE Smart Storage Administrator Web GUI"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm"
        hpessad.service)
sha256sums=('CA9F482485944904126222DD4F79D64FD7AEED410108E0FF3B0344846E916DD4'
'B7DCBD13FECB9ED30C0B0AD01AE2B3D0916EA97A46FAB4BD3D1DB2BCEAC5EF04')

package() {
	mv usr/{sbin,bin}
	mv usr/{,share/}man
	install -Dm644 opt/smartstorageadmin/ssa/ssa.license "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	rm opt/smartstorageadmin/ssa/ssa.license
	cp -a opt usr "$pkgdir"
    #Systemd unit file install
    install -Dm644 hpessad.service "$pkgdir"/usr/lib/systemd/system/hpessad.service
	}
