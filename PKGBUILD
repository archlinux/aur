# Maintainer: éclairevoyant

_gitname=cvt_modeline_calculator_12
pkgname=cvt12-git
pkgver=r17.6f66135
pkgrel=1
epoch=1
pkgdesc='Generate mode timings using the CVT v1.2/v1.1 Timing Standards'
arch=(i686 x86_64)
url="https://github.com/kevinlekiller/$_gitname"
depends=(glibc)
license=(BSD)
makedepends=(git)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitname
	gcc $CFLAGS cvt12.c -O2 -o cvt12 -lm -Wall $LDFLAGS
}

package() {
	install -Dm755 $_gitname/cvt12 -t "$pkgdir/usr/bin/"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/cvt12/LICENSE" <<eof
Copyright (c) 2001, Andy Ritger  aritger@nvidia.com
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

o Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
o Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer
  in the documentation and/or other materials provided with the
  distribution.
o Neither the name of NVIDIA nor the names of its contributors
  may be used to endorse or promote products derived from this
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

This program is based on the Generalized Timing Formula(GTF TM)
Standard Version: 1.0, Revision: 1.0

The GTF Document contains the following Copyright information:

Copyright (c) 1994, 1995, 1996 - Video Electronics Standards
Association. Duplication of this document within VESA member
companies for review purposes is permitted. All other rights
reserved.

While every precaution has been taken in the preparation
of this standard, the Video Electronics Standards Association and
its contributors assume no responsibility for errors or omissions,
and make no warranties, expressed or implied, of functionality
of suitability for any purpose. The sample code contained within
this standard may be used without restriction.
eof
}
