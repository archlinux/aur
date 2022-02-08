# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# Contributors: SaC Development Team <info AT sac-home DOT org>

pkgname=sac-compiler-weekly-basic
_version=1.3.3
_rev=1
_changes=738
_name=MijasCosta
_commit=gc21cf93
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The compiler (sac2c) of the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('gcc' 'libxcrypt' 'util-linux-libs')
optdepends=('sac-stdlib-weekly-basic: StdLib for the SaC Compiler basic-release')
#makedepends=('python' 'python-argparse') # XXX once sac-version-manager is running on python3
provides=('sac-compiler')
replaces=('sac-compiler')
conflicts=('sac-compiler' 'sac-compiler-weekly')
source=("https://gitlab.sac-home.org/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_version}-${_changes}-${_rev}/basic/sac2c-${_version}-${_name}-${_changes}-${_commit}-omnibus.tar.gz"
        'LICENSE.txt'
        'Makefile')
sha256sums=('b341d451c7ebaf4c3af88886868b5df7095365080dcc52026f93e862ab00997e'
            '01938a80d588cf44e2c8ef644c0bdd833ce5a6abc1becbe5a32a2448524e44fe'
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
