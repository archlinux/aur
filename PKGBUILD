# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=maple-video-downloader-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Multi-platform video and audio downloader with embedded session and cookie capture (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MapleProjects/maple-video-downloader"
license=('MIT')
provides=('maple-video-downloader')
conflicts=('maple-video-downloader')
depends=('gtk3' 'webkit2gtk-4.1' 'yt-dlp' 'ffmpeg' 'xdg-utils' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=(
    "$pkgname-$pkgver-$arch.tar.gz::$url/releases/download/v$pkgver/maple-video-downloader-$pkgver-$arch.tar.gz"
    "LICENSE::$url/raw/v$pkgver/LICENSE"
)
sha256sums=(
    '1bbfc079e10c815fa313994e1d86e9ef02862b5dd5f779a2d58e98cb25cd6e4c'
    '1b25291234b39dbb75194d96229894bfa403a9e3d61b0aa91989319c66b9259f'
)

package() {
    install -d "$pkgdir/opt/maple-video-downloader"
    cp -r "$srcdir/maple-video-downloader-$pkgver-$arch/." \
        "$pkgdir/opt/maple-video-downloader/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/maple-video-downloader" <<-'EOF'
	#!/bin/bash
	export WEBKIT_DISABLE_DMABUF_RENDERER=1
	exec /opt/maple-video-downloader/maple_video_downloader "$@"
	EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/maple-video-downloader.desktop" <<-'EOF'
	[Desktop Entry]
	Name=Maple Video Downloader
	GenericName=Video Downloader
	Comment=Multi-platform video and audio downloader with embedded session and cookie capture
	Exec=/usr/bin/maple-video-downloader %U
	Icon=maple-video-downloader
	Terminal=false
	Type=Application
	Categories=Network;AudioVideo;Video;
	Keywords=youtube;downloader;video;audio;mp3;mp4;tiktok;twitter;yt-dlp;
	StartupWMClass=com.mapleprojects.maple_video_downloader
	EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/icons/hicolor/scalable/apps/maple-video-downloader.svg" <<-'EOF'
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="512" height="512">
	  <defs>
	    <linearGradient id="bgGrad" x1="0%" y1="0%" x2="100%" y2="100%">
	      <stop offset="0%" stop-color="#1A102F"/>
	      <stop offset="100%" stop-color="#0A0612"/>
	    </linearGradient>
	    <linearGradient id="primaryGrad" x1="0%" y1="0%" x2="100%" y2="100%">
	      <stop offset="0%" stop-color="#C084FC"/>
	      <stop offset="50%" stop-color="#A855F7"/>
	      <stop offset="100%" stop-color="#7E22CE"/>
	    </linearGradient>
	    <linearGradient id="cyanGrad" x1="0%" y1="0%" x2="100%" y2="100%">
	      <stop offset="0%" stop-color="#22D3EE"/>
	      <stop offset="100%" stop-color="#06B6D4"/>
	    </linearGradient>
	    <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">
	      <feGaussianBlur stdDeviation="16" result="blur" />
	      <feComposite in="SourceGraphic" in2="blur" operator="over" />
	    </filter>
	  </defs>

	  <!-- Rounded Base Background -->
	  <rect x="24" y="24" width="464" height="464" rx="112" fill="url(#bgGrad)" stroke="#3B2667" stroke-width="4"/>

	  <!-- Maple Leaf Silhouette Backdrop -->
	  <path d="M 256,70 L 285,150 L 370,125 L 340,205 L 430,225 L 360,285 L 390,365 L 305,335 L 280,420 L 256,360 L 232,420 L 207,335 L 122,365 L 152,285 L 82,225 L 172,205 L 142,125 L 227,150 Z"
	        fill="url(#primaryGrad)" opacity="0.35" filter="url(#glow)"/>

	  <!-- Center Download Arrow & Tray -->
	  <g filter="url(#glow)">
	    <!-- Download Arrow -->
	    <path d="M 256,130 L 256,310 M 180,240 L 256,316 L 332,240"
	          stroke="url(#cyanGrad)" stroke-width="36" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
	    <!-- Bottom Tray -->
	    <path d="M 140,360 L 372,360"
	          stroke="url(#primaryGrad)" stroke-width="34" stroke-linecap="round"/>
	  </g>
	</svg>
	EOF

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
