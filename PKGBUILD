# Maintainer: Andrei Korshikov <andrej.s.korshikov at gmail dot com>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname='cvs-feature-bin'
# "+real" does not mean anything special for us, take it as a string of random characters
#   It was added somewhen around 2010..2011 by Thorsten Glaser when he remade Debian cvs package from scratch
#   (just epoch bumping was not enough for some reason).
#   It does not relate to the current "+really" convention described in
#   https://www.debian.org/doc/debian-policy/ch-controlfields.html#version .
pkgver='1.12.13+real_31'
pkgrel='1'
pkgdesc='Concurrent Versions System — a version control system; feature release binaries, extracted from Debian packages'
arch=('x86_64')
url='https://cvs.nongnu.org'
license=('GPL-2.0-or-later')    # https://savannah.nongnu.org/projects/cvs
optdepends=(
    'inetutils: for using cvs over rsh'
    'openssh: for using cvs over ssh'
    )
provides=("cvs=${pkgver}")
conflicts=('cvs')
options=('!debug')  # Debian package does not contain debugging info
source=("https://ftp.debian.org/debian/pool/main/c/cvs/cvs_1.12.13+real-31_amd64.deb")
b2sums=('f0afa0f6c18d021bfd38ae6101b1cb6113110bca6f564589457ee68abc677dfea8e876c9e61395f45c9d28c5f77ae16c4d5f08f980dbd940f32664419960d376')

package() {
    # Runtime-only dependencies
    depends=(
        'libcrypt.so'        # provided by "libxcrypt-compat"
        'libgssapi_krb5.so'  # provided by "krb5"
        'libkrb5.so'         # provided by "krb5"
        'libz.so'            # provided by "zlib"

        'glibc'   # "libc.so" is not specified as "provides"
        'libbsd'  # "libbsd.so" is not specified as "provides"
        'mksh'    # required by /usr/bin/cvs-switchroot script
        'perl'    # required by /usr/share/cvs/contrib/… scripts
        'sh'      # required by /usr/share/cvs/contrib/… scripts
        )

    bsdtar --extract --file='data.tar.gz' --directory="${pkgdir}"
    }
