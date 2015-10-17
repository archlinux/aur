# Maintainer: jjacky
# Contributor: Michał Siejak <my_fistname@my_lastname.pl>
pkgname=xlsh-without-x
pkgver=0.2.2
pkgrel=4
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
        '0008-Makefile-Install-in-prefix-bin-not-prefix-sbin.patch'
        '0009-config-Use-better-commands-to-reboot-halt.patch'
        '0010-Replace-command-shutdown-with-halt-poweroff.patch'
        )
sha256sums=('ffc8c31503d252d104f98259842a8da5163862870bfdfe0a07ffc0833b6a1102'
            '7ff3d8a1c3489229aac8d5c1447a9d5781b00682098f703b70a61e5fb38d7d5b'
            'ae8bb3edb173f41572f77e64b24485cab8805ac92bdfe4f6989c2bce0c1ce021'
            'da5793bc553731e5c65a6583d086af4b5b86b1df5d03dac9d0b48d10cb506d0c'
            '13df8bdf21d3ae7e9b7efc5d800ae2c4e596c9ff2fae6326d0b2fdcb66b2b89c'
            '102b5123fd60a8331c856a4fc8b50d3332455cb4f4e38b962eb6057345fa4f8e'
            '069dee189df6de6f8a3459a42ad30afb14ecfb306e31d59283f99fd48ae68298'
            '049601322afdcc621c9c340bcb5376cfc54f624391dffa9829d25b5b71181251'
            'a46ac173fb130bd88ba706255bb0ff15815cdb770196a01a3fb433340ac742f3'
            '9684b8e822bfaba8e7213bafea89929a6c2834a43fb0b3223f07b6e8a71b8f8a'
            '4c8c5304a649bcb1d1d522614a0ac6fdc468f69ed00c02e002b620d9076165b7')

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
    patch -p1 -i ../0009-config-Use-better-commands-to-reboot-halt.patch
    patch -p1 -i ../0010-Replace-command-shutdown-with-halt-poweroff.patch
}

build() {
    cd xlsh
    make
}

package() {
    cd xlsh
    make DESTDIR="$pkgdir" install
}
