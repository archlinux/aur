# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: mehalter <micah at mehalter.com>
# Contributor: OpenPrivacy <maildrop AT comedia DOT com>
# Contributor: Cyrinux <pkgbuilds AT levis DOT name>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
pkgname=openscap
pkgver=1.4.4
pkgrel=1
pkgdesc='Open Source Security Compliance Solution'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://www.open-scap.org/'
license=('LGPL-2.1-or-later')
depends=(
	'acl'
	'bzip2'
	'curl'
	'dbus'
	'glib2'
	'libcap'
	'libgcrypt'
	'libldap'
	'libxml2'
	'libxslt'
	'libyaml'
	'openssl'
	'pcre2'
	'perl-xml-parser'
	'perl-xml-xpath'
	'popt'
	'procps-ng'
	'python'
	'util-linux-libs'
	'xmlsec'
)
makedepends=(
	'cmake'
	'doxygen'
	'swig'
)
optdepends=(
	'libselinux: SELinux boolean and security context probes'
	'openssh: oscap-ssh utility for scanning remote hosts'
	'rpm-tools: rpminfo probe and scap-as-rpm utility'
)
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c69736bee997e50a04aff8e4f22da880f342190e1289c5df0fb73b7af34833d3bd9f4e5055b227a18d571167671f821701a09f8c9a3e4568c7da68cc4be51133')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
