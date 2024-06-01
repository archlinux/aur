# Maintainer: Auditor_3D <06wiretap.loud@icloud.com>
_pkgname=landropv2
pkgname="${_pkgname}-appimage"
pkgver=2.1.2
pkgrel=1
pkgdesc="Drop any files to any devices on your LAN."
arch=('x86_64')
url="https://releases.landrop.app/LANDrop-latest-linux.AppImage"
license=('custom:LANDrop-license')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
icon=LANDrop.svg

source_x86_64=(
    "${_appimage}::https://releases.landrop.app/LANDrop-latest-linux.AppImage"

)
noextract=("${_appimage}")
sha256sums_x86_64=('246b3c2535b6de9a1cf038f378ed027a7094c6d315798400bff30791d51ea93f')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/LANDrop.desktop" "${pkgdir}/usr/share/applications/LANDrop.desktop"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
 
  mkdir -p "${pkgdir}/usr/bin"
  touch "${pkgdir}/usr/bin/LANDrop"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/LANDrop"
  echo '/opt/landropv2-appimage/landropv2-appimage.AppImage $1' >> "${pkgdir}/usr/bin/LANDrop"

  chmod +x "${pkgdir}/usr/bin/LANDrop"

  mkdir -p "${pkgdir}/usr/share/applications"
  touch "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Name=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Exec=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Icon=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Categories=Network;Utility" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  touch "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo 'LANDrop v2.1.2
  
  Drop any files to any devices on your LAN.
  
  Copyright (c) 2021-2024, SkyArc LLC
  All rights reserved.
  
  Redistribution and use in binary forms without modification, are permitted provided that the following conditions are met:
  
  1. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
  
  2. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
  
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  
  LANDrop Icon
  
  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  
  
  Third Party Software & Artworks
  
  libsodium
  
  ISC License
  
  Copyright (c) 2013-2024
  Frank Denis <j at pureftpd dot org>
  
  Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.
  
  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  
  secp256k1
  
  Copyright (c) 2013 Pieter Wuille
  
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  
  Material Design Icons
  
  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
  
  http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.' >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
