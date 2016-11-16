# Maintainer: jjacky
# Contributor: Michał Siejak <my_fistname@my_lastname.pl>
pkgname=xlsh-without-x
pkgver=0.2.2
pkgrel=6
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
        '0011-Handle-perms-on-tty-node.patch'
        )
sha256sums=('ffc8c31503d252d104f98259842a8da5163862870bfdfe0a07ffc0833b6a1102'
            '7b5f36f2a1f072d095c4aae3bd533502ef0d994003fab3771d02473c595a725c'
            '1b08ab4067e97458705fc2157e49de9725b4ae6a5297372d47f78f0ef734e5c4'
            'ad6ea1b336b8e90d1d1a9bc00e357d2ea4e371ee73bfabdcb479950bfe250869'
            'cfa94b26198615fd9d4f6c1ac4a6a76e5fd05c5d15cc9a5388e4ac5fb0f85347'
            '275e1d144ec0d3acb8e45d192d43bf7c007a458680fe623f22b1cfc4a51a5ef2'
            '04cb80f482b6c21f694887aefd7d2e0fe7287c7840a7d6668fd2953a9e0258bd'
            'b6d1c18f3ce496ffc80a80960c8353b7336348faf5fd745a7934fc2a573e422e'
            '3927c72453cf456d6bb2c7afedef07949c65ceecedae8193519bb4ce9f77f9d5'
            'fbfca8ddfc83763b2a20e2f0b7d1d673de74562466ef5faabd0ddc20dffcde39'
            '21971b08b79229500dd2d01ed4387f9b2465580411b8d088911d501107e27acf'
            'e6e8bf924d260a5dd6caa285362b8b7271973e2fee58ea5fa980a7edf111b4e4')

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
    patch -p1 -i ../0011-Handle-perms-on-tty-node.patch
}

build() {
    cd xlsh
    make
}

package() {
    cd xlsh
    make DESTDIR="$pkgdir" install
}
