# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-compiler-weekly
_version=1.3.3
_rev=1
_changes=659
_name=MijasCosta
_commit=g81b0e
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The compiler (sac2c) of the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('gcc' 'hwloc' 'cuda')
optdepends=('sac-stdlib-weekly: StdLib for the SaC Compiler')
#makedepends=('python' 'python-argparse') # XXX once sac-version-manager is running on python3
provides=('sac-compiler')
replaces=('sac-compiler')
conflicts=('sac-compiler')
source=("https://gitlab.sac-home.org/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_version}-${_changes}-${_rev}/full/sac2c-${_version}-${_name}-${_changes}-${_commit}-omnibus.tar.gz"
        'LICENSE.txt'
        'Makefile')
sha256sums=('f48fe4532fe6ccbe85bc1f515bc055870bee45bf11430ccd2798a62f2682b0f5'
            'cb641cc7eb118bbf08dadffc35c57eb7a1ab4d542c3e73c79f5c4f7c1560bf22'
            'eb965cc10ff6d032627429b87c553c2eb962d92753a8e30cfebdf699d1f5504a')

build () {
    cd "$srcdir/src"

    # build binaries
    make -f "$srcdir/Makefile"
}

package() {
	cd "$srcdir"

    # install libraries
    install -d "$pkgdir/usr/local"
    cp -r share "$pkgdir/usr/local/"
    cp -r include "$pkgdir/usr/local/"
    cp -r lib "$pkgdir/usr/local/"
    cp -r libexec "$pkgdir/usr/local/"

    # install binaries
    find "src" -type f -executable -exec cp {} "$pkgdir/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}" \;

    # create symlinks
    # XXX replace with sac-version-manager script (uses python2 with specific depends, I don't want to pull these in!)
    install -d "$pkgdir/usr/local/bin"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2c_d" "$pkgdir/usr/local/bin/sac2c_d"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac4c_d" "$pkgdir/usr/local/bin/sac4c_d"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2tex_d" "$pkgdir/usr/local/bin/sac2tex_d"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2c_p" "$pkgdir/usr/local/bin/sac2c_p"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac4c_p" "$pkgdir/usr/local/bin/sac4c_p"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2tex_p" "$pkgdir/usr/local/bin/sac2tex_p"

    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/saccc_p" "$pkgdir/usr/local/bin/saccc_p"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/saccc_d" "$pkgdir/usr/local/bin/saccc_d"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csimt_p" "$pkgdir/usr/local/bin/csimt_p"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csimt_d" "$pkgdir/usr/local/bin/csimt_d"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csima_p" "$pkgdir/usr/local/bin/csima_p"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csima_d" "$pkgdir/usr/local/bin/csima_d"

    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2c_p" "$pkgdir/usr/local/bin/sac2c"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac4c_p" "$pkgdir/usr/local/bin/sac4c"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/sac2tex_p" "$pkgdir/usr/local/bin/sac2tex"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/saccc_p" "$pkgdir/usr/local/bin/saccc"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csimt_p" "$pkgdir/usr/local/bin/csimt"
    ln -s "/usr/local/libexec/sac2c/${_version}-${_name}-${_changes}-${_commit}/csima_p" "$pkgdir/usr/local/bin/csima"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
