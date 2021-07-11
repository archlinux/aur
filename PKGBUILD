# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: PQCraft <0456523@gmail.com>
pkgname="clibasic-bin"
pkgver="git"
pkgrel=3
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=('i686' 'x86_64')
url="https://github.com/PQCraft/clibasic"
license=('GPLv3')
depends=('glibc' 'unzip' 'wget' 'readline')
provides=('clibasic')

prepare() {
    rm -rf clibasic*
}   

package() {
    cd "${srcdir}"
    TAG="$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/PQCraft/clibasic.git '*.*.*' | tail --lines=1 | cut --delimiter='/' --fields=3)"
    ZIPURL="https://github.com/PQCraft/clibasic/releases/download/$TAG"
    if [ "$(getconf LONG_BIT)" = "32" ]; then 
        ZIPFILE="clibasic-linux-x86.zip"
    else
        ZIPFILE="clibasic-linux-x64.zip"
    fi
    wget "$ZIPURL/$ZIPFILE"
    mkdir -p "${pkgdir}/usr/bin/"
    unzip -p "$ZIPFILE" "clibasic" > "${pkgdir}/usr/bin/clibasic"
    chmod +x "${pkgdir}/usr/bin/clibasic"
}

