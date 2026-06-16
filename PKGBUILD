# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=lzbench-bin
_name=${pkgname%-bin}
pkgver=2.3
pkgrel=1
pkgdesc='An in-memory benchmark of open-source compressors'
arch=(aarch64 powerpc64le x86_64)
url='https://github.com/inikep/lzbench'
license=(
    '0BSD'                                          # xz
    'Apache-2.0'                                    # glza, kanzi-cpp, libbsc, tamp, yappy
    'BSD-2-Clause'                                  # lizard, lz4, lzlib, lzsse
    'BSD-2-Clause OR GPL-2.0-or-later'              # lzf
    'BSD-3-Clause'                                  # gipfeli, lzfse, snappy, zling, zxc
    'BSD-3-Clause OR GPL-2.0-only'                  # fast-lzma2, zstd
    'bzip2-1.0.6'                                   # bzip2
    'CC0-1.0'                                       # wflz
    'CDDL-1.0'                                      # lzjb
    'GPL-1.0-only OR GPL-2.0-only OR GPL-3.0-only'  # quicklz
    'GPL-2.0-only OR GPL-3.0-only'                  # lzbench
    'GPL-2.0-or-later'                              # lzmat, lzo, ucl
    'GPL-3.0-or-later'                              # tornado
    'LGPL-3.0-or-later'                             # bzip3
    'LicenseRef-Public-Domain'                      # 7-zip, crush, lzham, lzrw, ppmd8, yalz77
    'MIT'                                           # aceapex, brotli, fastlz, libdeflate, lzav, memlz, rapidhash (bundled in zxc), skim, slz
    'MIT OR Apache-2.0'                             # density
    'MIT AND Unlicense'                             # zpaq
    'Unlicense'                                     # csc
    'Zlib'                                          # brieflz, liblzg, zlib, zlib-ng
)
provides=($_name)
conflicts=($_name)
source=($url/archive/v$pkgver/$_name-$pkgver.tar.gz
        $_name-$pkgver-fastlz-LICENSE::https://raw.githubusercontent.com/ariya/FastLZ/0.5.0/LICENSE.MIT
        $_name-$pkgver-liblzg-LICENSE::https://gitlab.com/mbitsnbites/liblzg/-/raw/182b56cb36843720f38eff2ec30db1deac4e85bd/LICENSE.txt
        $_name-$pkgver-lzham-LICENSE::https://raw.githubusercontent.com/richgel999/lzham_codec/b33fd27f12a8b414ac83743b9430022054f0b291/LICENSE
        $_name-$pkgver-zxc-LICENSE::https://raw.githubusercontent.com/hellobertrand/zxc/v0.11.0/LICENSE)
source_aarch64=($_name-$pkgver-aarch64.gz::$url/releases/download/v$pkgver/lzbench${pkgver//.}_aarch64-linux-gnu-gcc13.gz)
source_powerpc64le=($_name-$pkgver-powerpc64le.gz::$url/releases/download/v$pkgver/lzbench${pkgver//.}_powerpc64le-linux-gnu-gcc13.gz)
source_x86_64=($_name-$pkgver-x86_64.gz::$url/releases/download/v$pkgver/lzbench${pkgver//.}_x86_64-linux-gnu-gcc15.gz)
b2sums=('a24d8a6112ff84e945ad7bc3683ecf30eddb1b1ac64ced25808b478ede2e5d7e8e54d169b443183c6326d2054a0452e57d7016e701210395345e1f24241de228'
        '4aef9b1eaff06cb7af4afe4be4815014f90bf8658441c37b21f9216673f54a356e7f4924e79f84cf76bd696536bee564fe1e9548e8336cca1e9d5c51cb43d2db'
        'b5c06bea9633a9e84116d64e21a3ee93e9294a6174a3917acf570a1ddbde6ce89229e61663189a0ba8e31bc8293a9050189d645d229a55533392dff8bbcb27a5'
        '1f039eee5271567cd8d9d23000f9fb08e882869adb2465ae5376e06eeb0c40d2aaf2506fd9f1124c6052f94c1212c298ec7ef41fee9233fc8f28e6fb69f86873'
        '64d6a86c8ac43bd1da62fce95c05a396cf281398ba887c6ca9a03365f32b3b8aa75d4eafe131f6fe1d9c075f7db26edfed6649bce3c0c63105785c11233f82a5')
b2sums_aarch64=('4bb973b3b6868ba584c543f545f63c585860bb3f599ec1ba0a2d56ed956b6ec56a1d9f18559fc4245555f84a97675cc09edbb6bd1d097f31b70fdb60531be498')
b2sums_powerpc64le=('d345dea54f57ac8dc554ca2a9e56993a02dc740723ce24e988a3617be289f773fe4721f51727861d56b72e565fd6104e6fccb00d8f2bf544ecb7a56144ad05e6')
b2sums_x86_64=('d44954b4fff9af17f437b93d08ef3c4185806585d72bdbe95b78ae9a425b6e4f8623546782b8c650cfea6b77cc09018939173c503a24ea481c3dd3ff8ded0547')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/lzbench"

    cd $_name-$pkgver
    install -Dm644 doc/lzbench.7.txt "$pkgdir/usr/share/man/man7/lzbench.7"

    local license_dir="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 bwt/bzip2/LICENSE            "$license_dir/bzip2-LICENSE"
    install -Dm644 lz/brieflz/LICENSE           "$license_dir/brieflz-LICENSE"
    install -Dm644 lz/brotli/LICENSE            "$license_dir/brotli-LICENSE"
    install -Dm644 lz/fast-lzma2/LICENSE        "$license_dir/fast-lzma2-LICENSE"
    install -Dm644 lz/gipfeli/COPYING           "$license_dir/gipfeli-COPYING"
    install -Dm644 lz/libdeflate/COPYING        "$license_dir/libdeflate-COPYING"
    install -Dm644 lz/lizard/LICENSE            "$license_dir/lizard-LICENSE"
    install -Dm644 lz/lz4/lib/LICENSE           "$license_dir/lz4-LICENSE"
    install -Dm644 lz/lzav/LICENSE              "$license_dir/lzav-LICENSE"
    install -Dm644 lz/lzfse/LICENSE             "$license_dir/lzfse-LICENSE"
    install -Dm644 lz/lzlib/COPYING             "$license_dir/lzlib-COPYING"
    install -Dm644 lz/lzsse/LICENSE             "$license_dir/lzsse-LICENSE"
    install -Dm644 lz/slz/LICENSE               "$license_dir/slz-LICENSE"
    install -Dm644 lz/snappy/COPYING            "$license_dir/snappy-COPYING"
    install -Dm644 lz/xz/COPYING                "$license_dir/xz-COPYING"
    install -Dm644 lz/zlib/LICENSE              "$license_dir/zlib-LICENSE"
    install -Dm644 lz/zlib-ng/LICENSE.md        "$license_dir/zlib-ng-LICENSE.md"
    install -Dm644 lz/zstd/LICENSE              "$license_dir/zstd-LICENSE"
    install -Dm644 misc/density/src/LICENSE-MIT "$license_dir/density-LICENSE"
    install -Dm644 misc/skim/LICENSE            "$license_dir/skim-LICENSE"
    install -Dm644 misc/zpaq/COPYING            "$license_dir/zpaq-COPYING"

    # Licenses absent in the lzbench tarball
    install -Dm644 "$srcdir/$_name-$pkgver-fastlz-LICENSE" "$license_dir/fastlz-LICENSE"
    install -Dm644 "$srcdir/$_name-$pkgver-liblzg-LICENSE" "$license_dir/liblzg-LICENSE"
    install -Dm644 "$srcdir/$_name-$pkgver-lzham-LICENSE"  "$license_dir/lzham-LICENSE"
    install -Dm644 "$srcdir/$_name-$pkgver-zxc-LICENSE"    "$license_dir/zxc-LICENSE"

    # License files not provided or only in source code
    cat > "$license_dir/aceapex-LICENSE" <<'EOF'
Copyright (c) 2026 yasha1971-coder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

    cat > "$license_dir/libzling-LICENSE" <<'EOF'
Copyright (C) 2012-2013 by Zhang Li <zhangli10 at baidu.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the project nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE PROJECT AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
EOF

    cat > "$license_dir/lzf-LICENSE" <<'EOF'
Copyright (c) 2000-2010 Marc Alexander Lehmann <schmorp@schmorp.de>

Redistribution and use in source and binary forms, with or without modifica-
tion, are permitted provided that the following conditions are met:

  1.  Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

  2.  Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MER-
CHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPE-
CIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTH-
ERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.

Alternatively, the contents of this file may be used under the terms of
the GNU General Public License ("GPL") version 2 or any later version,
in which case the provisions of the GPL are applicable instead of
the above. If you wish to allow the use of your version of this file
only under the terms of the GPL and not to allow others to use your
version of this file under the BSD license, indicate your decision
by deleting the provisions above and replace them with the notice
and other provisions required by the GPL. If you do not delete the
provisions above, a recipient may use your version of this file under
either the BSD or the GPL.
EOF

    cat > "$license_dir/memlz-LICENSE" <<'EOF'
Copyright (c) 2025 Lasse Mikkel Reinhold

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
