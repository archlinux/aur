# Maintainer: George Bereveskos <report@hellas.dev>
pkgname=godash
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal Personal Productivity Dashboard with integrated task management, notes, Google Calendar & weather"
arch=('x86_64')
url="https://github.com/HellasDev/GoDash"
license=('MIT')
depends=('glibc')
optdepends=(
    'firefox: For better browser integration with calendar links'
    'google-chrome: Alternative browser for calendar integration'
    'chromium: Alternative browser for calendar integration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HellasDev/GoDash/releases/download/v${pkgver}-bin/godash-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('26f62ac0967d201ce3c317709a5c86937be0901b3ff3ffae4fb93d25c81bce53')

package() {
    # Install binary
    install -Dm755 godash-linux-amd64 "${pkgdir}/usr/bin/godash"
    
    # Create documentation directory
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    # Add package information
    cat > "${pkgdir}/usr/share/doc/${pkgname}/README.txt" << 'EOF'
GoDash - Terminal Personal Productivity Dashboard

A modern terminal-based productivity dashboard that combines:
- Task management with persistent storage
- Markdown notes editor with live preview  
- Google Calendar integration with OAuth2 authentication
- Real-time weather information via wttr.in
- Beautiful, responsive terminal interface using Bubble Tea

This package contains a pre-built binary with embedded OAuth2 credentials
for immediate Google Calendar functionality - no additional setup required.

Features:
• Three-panel dashboard layout (todos, notes, calendar)
• Focus-driven navigation with mouse and keyboard support
• Automatic data persistence following XDG Base Directory spec
• Cross-platform OAuth2 flow (automatic + manual fallback)
• Markdown rendering with syntax highlighting
• Real-time weather updates for any location

Data Storage (Linux):
• Configuration: ~/.config/GoDash/
• Notes: ~/.local/share/GoDash/notes/
• Tasks: ~/.local/share/GoDash/todo-list.json
• Calendar cache: ~/.local/share/GoDash/

Quick Start:
1. Run 'godash' in your terminal
2. Enter your city for weather setup
3. Authorize Google Calendar when prompted
4. Start being productive!

Documentation: https://github.com/HellasDev/GoDash
Issues: https://github.com/HellasDev/GoDash/issues
License: MIT
EOF

    # Install license information
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License

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