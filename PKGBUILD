# Maintainer: nyanpasu64 <nyanpasu64 at tuta dot io>
# Contributor: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
_pkgname="archalien"
pkgname="${_pkgname}"-git
pkgver=c563489
pkgrel=1
pkgdesc="A tool you can use to convert a Debian package .deb to an Arch Linux package."
url="https://github.com/Asher256/archalien"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
source=("git+https://github.com/Asher256/${_pkgname}.git")
sha256sums=('SKIP')

_pkgname_bin="#! /usr/bin/python
# -*- python -*-
# -*- coding: utf-8 -*-

from archalien.archalien import command_required, fix_input_pkg, usage, more_informations, handle_arguments, read_debcontrol, write_archcontrol, convert

if __name__ == '__main__':
    try:
        command_required('ar', 'tar', 'find', 'sed')
        DATA = handle_arguments()
        convert(DATA['input_pkg'],
                DATA['output_pkg'])
    except KeyboardInterrupt:
        print(\"Interrupted.\")

# vim:ai:et:sw=4:ts=4:sts=4:tw=78:fenc=utf-8"

_python3_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

pkgver() {
	cd "${_pkgname}"
	git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

build() {
    cd "${_pkgname}"
    echo -e "$_pkgname_bin" | tee ${_pkgname}_bin
}

package() {
	cd "${_pkgname}"
	install -m 755 -D ${_pkgname}_bin "${pkgdir}/usr/bin/${_pkgname}"
	install -m 644 -D ${_pkgname}.py "${pkgdir}/usr/lib/python${_python3_version}/site-packages/${_pkgname}/${_pkgname}.py"
	install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
} 

# vim:set ts=4 sw=2 ft=sh et:
