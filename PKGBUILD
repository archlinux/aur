# Maintainer: jjacky
# Contributor: Michał Siejak <my_fistname@my_lastname.pl>
pkgname=xlsh-without-x
pkgver=0.2.2
pkgrel=3
pkgdesc="eXtended Login Shell - fast, minimalistic login replacement (without X support)"
arch=('i686' 'x86_64')
url="https://github.com/Nadrin/xlsh/wiki"
license=('GPL3')
depends=('pam' 'readline')
provides=('xlsh=0.2.2')
source=("xlsh-$pkgver.tar.gz::https://github.com/Nadrin/xlsh/tarball/master"
        '0001-Add-compilation-option-for-login-completion.patch'
        '0002-Remove-X-support.patch'
        '0003-config.h-Tweak-prompt.patch'
        '0004-Makefile-Switch-prefix-to-usr.patch'
        '0005-Don-t-block-signals-as-it-caused-issues.patch'
        '0006-Set-environment-from-PAM.patch'
        '0007-Add-.gitignore.patch'
        '0008-Makefile-Install-in-prefix-bin-not-prefix-sbin.patch')
sha256sums=('ffc8c31503d252d104f98259842a8da5163862870bfdfe0a07ffc0833b6a1102'
            '7c690c750fcb18d888782014f30109d5ed44b578f524a3cdae1ecaa3ae4fd6ae'
            'e293e25e9a8cbbe15249efce8f1300a83b7f35396666aca0d300363146fd013a'
            '5fa5f298015fda12b67914a255dc1d6988716959ea1400eaa8fd9773ce42c435'
            '94b539e8efa4158c19c0ff950f45a157b7d412cd56e86194d790f76912f19da5'
            'd6b8c6a83dbc95040200dc3b718f74be3922bf8b90db5683683adf12bd6f63de'
            'fdf1af691da9be4278be4b51727bd9eb07b4c9b244b8a772adc8b85482679cbe'
            '33000c592e06a518c4893d4d95209ba809dca97ae8115e22bc784d4c67a84cab'
            '6d9f1a050fc46264cdcb7d7bc05325dc44fb94d0213be10acf0c51ca9d8c7da9')

prepare() {
    mv Nadrin-xlsh-* xlsh
    cd xlsh

    patch -p1 -i ../0001-Add-compilation-option-for-login-completion.patch
    patch -p1 -i ../0002-Remove-X-support.patch
    patch -p1 -i ../0003-config.h-Tweak-prompt.patch
    patch -p1 -i ../0004-Makefile-Switch-prefix-to-usr.patch
    patch -p1 -i ../0005-Don-t-block-signals-as-it-caused-issues.patch
    patch -p1 -i ../0006-Set-environment-from-PAM.patch
    patch -p1 -i ../0007-Add-.gitignore.patch
    patch -p1 -i ../0008-Makefile-Install-in-prefix-bin-not-prefix-sbin.patch
}

build() {
    cd xlsh
    make
}

package() {
    cd xlsh
    make DESTDIR="$pkgdir" install
}
