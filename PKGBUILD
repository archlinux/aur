# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-compiler-weekly-basic
_version=1.3.3
_rev=1
_changes=390
_name=MijasCosta
_commit=g4d66b
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The compiler (sac2c) of the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('gcc' 'hwloc')
optdepends=('sac-stdlib-weekly-basic: StdLib for the SaC Compiler basic-release')
#makedepends=('python' 'python-argparse') # XXX once sac-version-manager is running on python3
provides=('sac-compiler' 'sac-compiler-weekly')
replaces=('sac-compiler' 'sac-compiler-weekly')
conflicts=('sac-compiler' 'sac-compiler-weekly')
source=("https://gitlab.science.ru.nl/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_version}-${_changes}-${_rev}/basic/sac2c-${_version}-${_name}-${_changes}-${_commit}-omnibus.tar.gz"
        'LICENSE.txt'
        'Makefile')
sha256sums=('0f6417a0549d66bbe257a6b34b04578e5177851caa78a8058161648e9e1c3555'
            '70a44340820b0515f1d29e663342f0ed8efb3a29fa5619f18461cbaf7cdf27c3'
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
